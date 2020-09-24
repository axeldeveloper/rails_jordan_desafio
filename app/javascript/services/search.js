import Http from './http'; 


export const include = (blacklist) => { 
  return Http.post('/api/v1/searchs/include', { blacklist });
};

// update
export const update = (blacklist) => { 
    return Http.put(`/api/v1/searchs/update/${blacklist.id}`, {blacklist});
};


// consulta
export const getCpfBlackList = (cpf = 0) => {
    return Http.get(`/api/v1/searchs/list?cpf=${cpf}`);
};