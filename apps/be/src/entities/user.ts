export class User {
  constructor(
    private _id: string,
    private _name: string,
    private _email: string,
  ) {
    this._id = _id;
    this._name = _name;
    this._email = _email;
  }

  set id(id: string) {
    this.id = id;
  }

  get id(): string {
    return this._id;
  }

  set name(name: string) {
    this.name = name;
  }

  get name(): string {
    return this._name;
  }

  set email(email: string) {
    this.email = email;
  }

  get email(): string {
    return this._email;
  }
}
