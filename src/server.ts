import fastify from "fastify";

const app = fastify();

app.get('/', () => {
  return 'Application for test create docker image and CI/CD with Github Actions';
})

app.listen({ port: 3333, host: '0.0.0.0' }).then(() => {
  console.log("Server is running on port 3333");
})