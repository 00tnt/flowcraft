import cookieParser from 'cookie-parser';
import cors from 'cors';
import 'dotenv/config';
import express from 'express';

import v1Router from '@/routes/v1';

const app = express();

// CORS configuration
app.use(
  cors({
    origin: process.env.CORS_ORIGIN.split(','), // Frontend URLs
    credentials: true, // Allow cookies
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With'],
  }),
);

// Body parser middleware (built into Express 5.x)
app.use(express.json({ limit: '10mb' })); // Parse JSON bodies
app.use(express.urlencoded({ extended: true, limit: '10mb' })); // Parse URL-encoded bodies

// Cookie parser middleware
app.use(cookieParser());

// Static files
app.use(express.static('public'));

app.get('/health', (_, res) => {
  res.json(200).json('ok');
});

app.use('/api/v1', v1Router);

const port = process.env.PORT || 8080;

app.listen(port, () => {
  console.log(`listening on port ${port}`);
});
