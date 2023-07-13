module.exports = class AthletsController {

    static async getAllAthlets(req,res){
        res.json({status : "success", message : "all athlets"})
    }

    static async registerAthlet(req,res){
        res.json({status : "success", message : "athlets registration form"})
    }

}