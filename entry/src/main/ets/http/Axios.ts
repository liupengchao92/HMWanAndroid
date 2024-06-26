import axios, { Axios, AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import HttpRespond from './HttpRespond';

// 基地址
const BASE_URL = 'https://www.wanandroid.com/'

//1.创建axios对象
const instance = axios.create({
  baseURL: BASE_URL,
  timeout: 5000,
})

// 2.添加请求拦截器
instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 对请求数据做点什么
  return config;
}, (error: AxiosError) => {
  // 对请求错误做些什么
  return Promise.reject(error);
});

// 3.添加响应拦截器
instance.interceptors.response.use((response: AxiosResponse) => {

  return response

}, (error: AxiosError) => {
  // 对响应错误做点什么
  return Promise.reject(error);
});


// get 请求
export function requestGet<T>(url: string, params?: any): Promise<T> {
  return new Promise((resolve, reject) => {
    instance.get(url, { params }).then(respond => {
      if (respond.status == 200) {
        const data = respond.data as HttpRespond<T>
        if (data.errorCode == 0) {
          return resolve(data.data)
        }
        return reject(new Error(data.errorMsg))
      }
      return reject(new Error(respond.statusText))
    }).catch(error => {
      return reject(error)
    })
  })
}

