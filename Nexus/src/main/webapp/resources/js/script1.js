const getButton = document.getElementById('get1');

const test12 = document.getElementById('test12'); 

const multiInput = document.getElementById('multi-input'); 

const values = document.querySelector('#values'); 
const noStack = document.getElementById('noStack');

getButton.onclick = () => {
  if (multiInput.getValues().length > 0) {
  		getButton.innerText="저장되었습니다";
  	    values.textContent = `${multiInput.getValues().join(',')}`;
  } else {
    values.textContent = 'Got noon123e  :`^(.'; 
  }
}

test12.onclick = () => {
  if (multiInput.getValues().length > 0) {
  	    values.textContent = `${multiInput.getValues().join(',')}`;
  } else {
    values.textContent = 'Got noon123e  :`^(.'; 
  }
}


