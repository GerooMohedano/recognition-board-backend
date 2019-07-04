class MyRoutes {
    constructor(express, router, sql, bodyParser, config) {
        this.express = express;
        this.router = router;
        this.sql = bodyParser;
        this.config = config;
    }
}

module.exports = MyRoutes;
