alert(_fly_swatter_id);

$.ajax({
  url: 'http://localhost:3001/users/' + _fly_swatter_id + '/widget',
  type: 'GET',
  success: function(json) {
    renderWidget(json);
  }
});

function renderWidget(json) {
  console.log('Rendering..');
  console.log(json);
}
