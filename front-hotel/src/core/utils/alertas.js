import { Modal } from "bootstrap"; 
import { createStore } from 'vuex';

export let CONSTANTES = {
    
}

export const store = createStore({ 
    state: {
        title: '',
        description: '',
        btnAceptar: () => {},
        btnCancelar: () => {}
    },
    getters: {
        get_title: state => state.title,
        get_description: state => state.description,
        get_btnAceptar: state => state.btnAceptar,
        get_btnCancelar: state => state.btnCancelar,
    },
    mutations: {
        set_title: (state, payload) => state.title = payload,
        set_description: (state, payload) => state.description = payload,
        set_btnAceptar: (state, payload) => state.btnAceptar = payload,
        set_btnCancelar: (state, payload) => state.btnCancelar = payload
    },
});
   
let myModal = null;

export const abrirAlerta = (titulo = "Titulo", mensaje = "Mensaje de la alerta", btnAceptar = () => {}, btnCancelar = () => {}) => {
    myModal = Modal.getOrCreateInstance('#alertModal');
    myModal.show();
    store.commit('set_title', titulo)
    store.commit('set_description', mensaje)
    store.commit('set_btnAceptar', btnAceptar)
    store.commit('set_btnCancelar', btnCancelar)
}

export const cerrarAlerta = () => {
    myModal = Modal.getOrCreateInstance('#alertModal');
    myModal.hide();
}