<?php

if(isset($_POST['select_id'])) {
  echo createText($_POST['select_id']);
  exit;
}

echo 'Hello,PHP !!';

function createText($selectId)
{

  switch($selectId) {
    case 1:
      return 'apple.';
    case 2:
      return 'orange.';
    case 3:
      return 'lemon';
    default:
      return 'fluits buscket.';
  }

}