import Http from './http'; 

// consulta
export const getStatusBlackList = () => {
    return Http.get("/api/v1/searchs/status");
};