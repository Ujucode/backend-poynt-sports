const { prisma } = require('../database')

const Mutation = {
    registerUser: (parent, args) =>{
        return prisma.user.create({
            data: {
                firstName: args.firstName,
                lastName: args.lastName,
                phone: args.phone,
                email: args.email,
                DOB: args.DOB,
                sport: args.sport,
                photo: args.photo,
                gender: args.gender,
                religion: args.religion,
                BloodGroup: args.BloodGroup,
                type: args.type,
            }
        })
    }
}

module.exports = { Mutation }