import { Modal } from "bootstrap";
let myModal = null;

export const abrirLoading = () => {
    myModal = Modal.getOrCreateInstance('#loadingModal');
    myModal.show();
}

export const cerrarLoading = () => {
    myModal = Modal.getOrCreateInstance('#loadingModal');
    myModal.hide();
}