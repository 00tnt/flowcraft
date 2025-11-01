import type { Request, Response } from 'express';

import type { UserService } from '@/services/user';

export class UserController {
  constructor(private _userService: UserService) {
    this._userService = _userService;
  }

  async getUser(_: Request, res: Response) {
    const user = await this._userService.getUser();
    res.status(200).json(user);
  }

  async getUsers(_: Request, res: Response) {
    const users = await this._userService.getUsers();
    res.status(200).json(users);
  }
}
