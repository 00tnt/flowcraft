import express from 'express';

const app = express();

app.get('/health', (_, res) => {
  res.send('ok');
});

const port = process.env.PORT || 8080;

app.listen(port, () => {
  console.log(`listening on port ${port}`);
});
