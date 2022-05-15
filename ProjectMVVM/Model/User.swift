import Foundation

struct User: Codable {
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    let picture: String
    let gender: String
   
    let phone: String
    let dateOfBirth:String
    let registerDate:String
    let updatedDate:String
    let location: Location
}

struct Location: Codable{
    let city:String
    let country:String
}
