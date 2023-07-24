const { ApolloServer } = require("@apollo/server")
const { resolvers } = require("./resolvers/index")
const { typeDefs } = require("./typedefs/index")
const { startStandaloneServer } = require("@apollo/server/standalone")

const app = new ApolloServer({resolvers,typeDefs})

const startServer = async() =>{
  const { url } = await startStandaloneServer(app, {
    listen: {
      port: 4000
    }
  })
  
  console.log(`server is listening at port : ${url}`);
}

startServer()