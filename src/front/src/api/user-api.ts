import SymfonyRequestor from "../utils/SymfonyRequestor";

export type User = {
    id: string;
    username: string;
}

class UserApi extends SymfonyRequestor<User> {
    constructor() {
        super('users');
    }
}

export default new UserApi();