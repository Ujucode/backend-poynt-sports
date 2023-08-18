const { prisma } = require('../database')

const Query = {
    basicUserInfo: (parent, args, context, info)=>{
        return { 
            firstName: 'Jhon',
            lastName: 'Doe',
            phone: '1234567890',
            email: 'Jhon@gmail.com',
            DOB: '02-01-1990',
            sport: 'Karate',
            photo: ['photo1','photo2'],
            gender: 'Male',
            religion: 'Hindu',
            BloodGroup: 'B_positive',
            type: 'ATHLETE'
            }
        },
}

module.exports = { Query }