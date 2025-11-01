import { User } from '@/entities/user';

export interface IUserRepository {
  findById(id: string): Promise<User>;
  findAll(): Promise<User[]>;
  create(user: User): Promise<User>;
  update(user: User): Promise<User>;
}
