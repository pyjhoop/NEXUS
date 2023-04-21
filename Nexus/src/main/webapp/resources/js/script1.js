const getButton = document.getElementById('get1');
const multiInput = document.querySelector('multi-input'); 
const values = document.querySelector('#values'); 

getButton.onclick = () => {
  if (multiInput.getValues().length > 0) {
  	console.log("digh");
  	    values.textContent = `${multiInput.getValues().join(',')}`;
  } else {
    values.textContent = 'Got noon123e  :`^(.'; 
  }
}

document.querySelector('input').focus();
