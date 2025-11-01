export interface IConnection {
  connect(): Promise<void>;
  getInstance(): any;
}

export class PostgresConnection implements IConnection {
  async connect(): Promise<void> {
    console.log('connecting to postgres');
  }

  getInstance(): any {
    return null;
  }
}

export class MongoConnection implements IConnection {
  async connect(): Promise<void> {
    console.log('connecting to mongo');
  }
  getInstance(): any {
    return null;
  }
}

export class DummyConnection implements IConnection {
  _instance: {
    getAllUsers(): Promise<any>;
  } | null = null;

  constructor(private _connectStr: string) {
    this._connectStr = _connectStr;
  }

  async connect(): Promise<void> {
    console.log('connecting to dummy', this._connectStr);
    this._instance = {
      getAllUsers: async () => {
        return [{ id: '1', name: 'name', email: 'email' }];
      },
    };
  }

  getInstance(): any {
    return this._instance;
  }
}
