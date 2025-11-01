import type { IConnection } from '@/db/connection';
import { User } from '@/entities/user';

import type { IUserRepository } from './IUserRepository';

export class UserRepository implements IUserRepository {
  constructor(private _db: IConnection) {
    this._db.connect();
  }

  async findById(id: string): Promise<User> {
    return new User(id, 'name', 'email');
  }

  async findAll(): Promise<User[]> {
    return this._db.getInstance().getAllUsers();
  }

  async create(user: User): Promise<User> {
    return new User(user.id, user.name, user.email);
  }

  async update(user: User): Promise<User> {
    return new User(user.id, user.name, user.email);
  }
}
