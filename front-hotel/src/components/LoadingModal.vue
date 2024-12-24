<template>
    <div class="modal fade" data-bs-backdrop="static" id="loadingModal" tabindex="-1" role="dialog" aria-labelledby="uniqueIdlLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content p-0">
                <div class="modal-body text-center">
                    <div class="d-flex justify-content-center">
                        <div class="spinner-border spinner-border-lg" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>        
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'LoadingModal',
        data() {
            return {
                myModal: null,
            }
        },
        async mounted () {
        },
        props: {
        
        },
        methods: {
        }
    }
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    .spinner-border {
        width: 10rem;
        height: 10rem;
    }
</style>