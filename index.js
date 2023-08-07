const { ApolloServer } = require("@apollo/server")
const { startStandaloneServer } = require("@apollo/server/standalone");
const { typeDefs } = require("./typedefs");
const { resolvers } = require("./resolvers");

const server = new ApolloServer({typeDefs,resolvers})

const startServer = async() =>{
  const { url } = await startStandaloneServer(server)
  console.log(`server runing at ${url}`)
}

startServer()