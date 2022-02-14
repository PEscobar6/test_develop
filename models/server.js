const express = require("express");
const cors = require("cors");
const db = require("../db/connection");
require("../db/relations");

class Server {
  constructor() {
    this.app = express();
    this.port = process.env.PORT || 8080;

    // Paths
    this.clientPath = '/api/clients';
    this.estadiaPath = '/api/estadia';

    // DB
    this.dbConnection();

    // Middlewares
    this.middlewares();

    // Routes
    this.routes();
  }

  async dbConnection(){
      try {
          await db.authenticate();
          console.log("Database online");
      } catch (error) {
          throw new Error(error);
      }
  }

  middlewares() {
    // CORS
    this.app.use(cors());

    // CORS
    this.app.use(cors());

    // Read and parse body
    this.app.use(express.json());

    // Public Directory
    this.app.use(express.static("public"));
  }

  routes() {
    this.app.use(this.clientPath, require("../routes/client"));
    this.app.use(this.estadiaPath, require("../routes/estadia"));
  }

  listen() {
    this.app.listen(this.port, () => {
      console.log("Server running on port ", this.port);
    });
  }
}

module.exports = Server;