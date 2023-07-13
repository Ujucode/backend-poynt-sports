const { Router } = require("express")
const AthletsController =  require("../controller/athlets.controller")

const router = new Router()

router.route('/allathlets').get(AthletsController.getAllAthlets);
router.route('/registerathlets').post(AthletsController.registerAthlet);

module.exports = router

