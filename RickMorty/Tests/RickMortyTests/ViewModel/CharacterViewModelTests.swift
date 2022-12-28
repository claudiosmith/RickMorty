import XCTest
import RxSwift

@testable import RickMorty

final class CharacterViewModelTests: XCTestCase {
    
    func testCharacterShouldExists() {
        
        let name = "Rick Sanchez"
        let disposeBag = DisposeBag()
        var appServerClient = MockCharacterService()
        
        guard let rmroot = MockRickMorty.mockRickMorty() else { return }
        appServerClient.fetchCharacterResult = .success(rmroot)
        
        let viewModel = CharacterViewModel(appServerClient, cache: nil)
        viewModel.fetchCharacters()
        
        let expectNormalCharacters = expectation(description: "all normal characters")
        var foundCharacter = false
        viewModel.observerCharacterList.subscribe ( onNext: { characters in
            
            foundCharacter = characters.contains(where: {$0.name == name})
            XCTAssertTrue(foundCharacter)
            expectNormalCharacters.fulfill()
                
        }).disposed(by: disposeBag)

        wait(for: [expectNormalCharacters], timeout: 1.0)
    }
    
    func testFetchWithApiError() {

        let disposeBag = DisposeBag()
        var appServerClient = MockCharacterService()

        appServerClient.fetchCharacterResult = .failure(CustomNetworkError(.invalidData))
        
        let viewModel = CharacterViewModel(appServerClient, cache: nil)
        viewModel.fetchCharacters()
        
        let expectedError = expectation(description: "failure fetch characters")
        var invalidOrNotFoundDataError = false
        
        viewModel.unitError.subscribe(onNext: {(error) in
            
            if let error = error as? CustomNetworkError,
               let message = error.failureDescription,
               message == ServiceError.invalidData.errorMessage {
               invalidOrNotFoundDataError = true
            }
            
            XCTAssertTrue(invalidOrNotFoundDataError, ServiceError.invalidData.errorMessage)
            expectedError.fulfill()
            
        }).disposed(by: disposeBag)

        wait(for: [expectedError], timeout: 1.0)
    }

}
