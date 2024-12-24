import axiosInstance from './axios';

export class Rest {

    /**
     * Consumir un servicio rest mediante una peticion tipo get
     *
     * @param   {string}  url  URL del servicio
     *
     * @return  {object}       Retorna todos los datos del servicio en un objeto con atributos
     */
    get = (url, request = {}) => {
        return new Promise((resolve) => {
            axiosInstance.get(url, {params: request}).then(({data}) => {
                resolve({
                    error: false,
                    data: data
                });
            }).catch(({response}) => {
                resolve({
                    error: true,
                    data: response
                })
            });
            
        })
    }
    
    /**
     * Consumir un servicio rest mediante una peticion tipo post
     *
     * @param   {string}  url   URL del servicio
     * @param   {object}  data  Objeto request con los datos a enviar al servicio
     *
     * @return  {object}        Retorna todos los datos del servicio en un objeto con atributos
     */
    post = (url, data) => {
        return new Promise((resolve) => {
            axiosInstance.post(url, data).then(({data}) => {
                resolve({
                    error: false,
                    data: data
                });
            }).catch(({response}) => {
                resolve({
                    error: true,
                    data: response.data
                })
            });
            
        })
    }
}