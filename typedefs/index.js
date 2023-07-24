const { graph } = require('@apollo/server')

const typeDefs = gql`{
    type User{
        id: ID!
        name : String!
        username : String!
        age : Int!
        nationality : Nationality!
        friends: [User]
        favoriteMovies: [Movie]
    } 
}
`
module.exports = { typeDefs }