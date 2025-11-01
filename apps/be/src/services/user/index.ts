import type { IUserRepository } from '@/repositories/user/IUserRepository';

export class UserService {
  constructor(private _userRepository: IUserRepository) {
    this._userRepository = _userRepository;
  }

  async getUser() {
    return this._userRepository.findById('1');
  }

  async getUsers() {
    return this._userRepository.findAll();
  }
}
