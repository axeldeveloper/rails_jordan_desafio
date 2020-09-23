import axios from 'axios';

const API_URL = 'http://localhost:3000'

const client = axios.create({
  baseURL: API_URL,
  timeout: 1000,
  //headers: {'X-Custom-Header': 'token'}
  headers: { 'Content-Type': 'application/json'},
});

export default client; 