import Http from './http'; 


export const include = ({ cpf, active }) => { 
  return Http.post('/api/vi/searchs/included', { cpf, active });
};

// update
export const update = (blacklist) => { 
    return Http.put(`/api/v1/searchs/update/${blacklist.id}`, {blacklist});
};


// consulta
export const getCpfBlackList = (cpf = 0) => {
    return Http.get(`/api/v1/searchs/list?cpf=${cpf}`);
};