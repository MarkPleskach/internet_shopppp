<h1>Категории:</h1>
<?php
$result = $conn->query("SELECT * FROM `product_category` WHERE 1 GROUP BY product_category.ID");

while ($row = $result->fetch()) {
//style="max-width: 18rem;"
    echo'
        
        <div class="card border-dark mb-3" >
            <div class="card-header"> ' . 'Категория' . $row['ID'] .'</div>
            <div class="card-body text-dark">
                <div class="row g-0"> 
                    <div class="col-md-10">
                    <a class="nav-link" href="/index.php?page=n" >                  
                               <p class="card-text">' . 'ID - ' .$row['id']  .'</>
                        <p class="card-text">' . ' ' .$row['category']  .'</>
                        </a>          
                   </div>
                    <div class="col-md-1">
                        <a href="delcategory.php?ID='.$row['id'].'" class="btn btn-danger">Удалить</a>
                    </div>                    
                </div>             
            </div>           
        </div>
 
    ';
}
?>

<h2>Добавить категорию</h2>
<form action="insertcategory.php" method="post" enctype="multipart/form-data">
    <p><label>
            ID категории: <input type="text" name="id">
        </label>
    <p><label>
            Название категории: <input type="text" name="product_name">
        </label>
    <p><input type="submit" value="Добавить">
</form>
