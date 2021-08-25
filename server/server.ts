import { Server } from "socket.io";
const io = new Server(3000);

console.log('Starting server waiting for clients...');
io.on("connection", (socket) => {
  console.log(`connect ${socket.id}`);

  socket.on("msg", (cb) => {
      console.log("msg");
      socket.emit('event', 'received');
  });

  socket.on("disconnect", () => {
      console.log(`disconnect ${socket.id}`);
  });
});
