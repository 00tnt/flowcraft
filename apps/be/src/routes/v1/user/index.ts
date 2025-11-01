import { Router } from 'express';

import { UserController } from '@/controllers/user';
import { DummyConnection } from '@/db/connection';
import { UserRepository } from '@/repositories/user/UserRepository';
import { UserService } from '@/services/user';

const userRouter = Router();

const dummyConnection = new DummyConnection('dummyConnection');
const userService = new UserService(new UserRepository(dummyConnection));
const userController = new UserController(userService);

userRouter.get('/', (req, res) => {
  return userController.getUsers(req, res);
});

export default userRouter;
