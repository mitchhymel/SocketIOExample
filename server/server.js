"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var socket_io_1 = require("socket.io");
var io = new socket_io_1.Server(3000);
console.log('Starting server waiting for clients...');
io.on("connection", function (socket) {
    console.log("connect " + socket.id);
    socket.on("msg", function (cb) {
        console.log("msg");
        socket.emit('event', 'received');
    });
    socket.on("disconnect", function () {
        console.log("disconnect " + socket.id);
    });
});
