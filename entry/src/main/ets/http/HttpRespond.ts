// 响应对象
export default interface HttpRespond<T> {
  data: T
  errorCode: number
  errorMsg: string
}