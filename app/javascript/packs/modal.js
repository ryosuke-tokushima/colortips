import Cookies from 'js-cookie';

function showModal() {
    $(document).ready(function() {
      if (Cookies.get('visited') === undefined) {
        $('#myModal').modal('show');
        Cookies.set('visited', 'true', { expires: 365, path: '/' });
      }
    });
}
  
export { showModal };