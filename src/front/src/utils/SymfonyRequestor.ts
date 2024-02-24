abstract class SymfonyRequestor<Model> {
    private _baseUrl: string;
    constructor(baseUri: string) {
        this._baseUrl = `${process.env.SYMFONY_URL ?? "http://localhost:8000"}/api/v1/${baseUri}`;
    }

    get baseUrl(): string {
        return this._baseUrl;
    }

    set baseUrl(value: string) {
        this._baseUrl = value;
    }

    async getAll(): Promise<Array<Model>> {
        const response = await fetch(this._baseUrl, {
            method: 'GET',
            mode: "cors",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            }
        });

        if(response.ok) {
            return response.json() as unknown as Array<Model>;
        }
        throw  new Error(`SymfonyRequestor Error on getAll for ${this._baseUrl} with status ${response.status} and message ${response.statusText}`)
    }
}

export default SymfonyRequestor;