const { prisma } = require('../database')
const { Query } = require('./query')
const { Mutation } = require('./mutation')

const resolvers = {
    Query,

  };

module.exports = { resolvers }


