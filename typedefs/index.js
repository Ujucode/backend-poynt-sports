// const { graph } = require('@apollo/server')

const typeDefs = `#graphql

  enum Role {
    ATHLETE
    COACH
    MENTOR
  }

  type BasicUserInfo{
    firstName: String
    lastName: String
    phone: String
    email: String
    DOB: String
    sport: String
    photo: [String]
    gender: String
    religion: String
    BloodGroup: String
    type: Role
  }

  type Query {
    basicUserInfo: BasicUserInfo
  }

  type Mutation {
    registerUser(firstName: String, lastName: String, phone: String, email: String, DOB: String, sport: String, photo: [String], gender: String, religion: String, BloodGroup: String, type: String): BasicUserInfo
  }
`
// type Mutation {
//   createUser(input: userInput) : basicUserInfo
// }

module.exports = { typeDefs }