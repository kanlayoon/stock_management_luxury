import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatFormFieldModule, MatError, MatFormField, MatPlaceholder, MatFormFieldControl } from '@angular/material/form-field';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { ProductService } from '../product/product.service';
import { Product } from './product.model';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Router, ActivatedRoute } from '@angular/router';
import { Inject} from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css'],
  
})
export class ProductComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  //
  animal: string;
  product: any;
  idp:any;
  code :any;
  name:any;
  exp:Date;
  amount:any;
  des:any;
  ins:any;
  type:any;
  data :any;
  selected : any;
  date:any;
  id:any;

  code_u : any;
  name_u : any;
  exp_u :Date;
  amount_u : any;
  des_u : any;
  ins_u : any;
  type_u : any;
  dateU :Date;
  typeup:any;
  idup :any;
  public idb :any;
  BP_id :any;
  Branch :any;
 
  private productList: Product[];
  constructor(public dialog: MatDialog, private route: ActivatedRoute,
    private router: Router,
    private productService: ProductService, private _http: Http,
    ) {
  }

  public products: any[];
  openDialog(Product_Code,Product_Name,BranchProduct_EXP:'dd/MM/yyyy',Product_Des
  ,Product_Instruction,BranchProduct_Amount,ProductType_Name,BranchProduct_Id,product): void {
  
  console.log("typeeeeeeeeeeeeeeeeeeeeee" + Product_Code+Product_Name+BranchProduct_EXP+Product_Des+Product_Instruction+BranchProduct_Amount+ProductType_Name+BranchProduct_Id);
    
    let dialogRef = this.dialog.open(updateProductDialog, {
      width: '400px',
      height: '500px',
     
        
      data: { code: Product_Code, name: Product_Name,exp:BranchProduct_EXP,
         des:Product_Des,ins:Product_Instruction,amount:BranchProduct_Amount ,types:ProductType_Name,typeup :this.typeup ,BP_id:BranchProduct_Id }  
    });
    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.code_u = result.code; 
      this.name_u = result.name;
      this.exp_u = result.exp;
      this.amount_u = result.amount;
      this.des_u = result.des;
      this.ins_u = result.ins;
      this.type_u = result.typeup;
      this.idup = Product_Code;
      this.BP_id = BranchProduct_Id;
      
//       console.log("code_u" + this.code_u);
//       console.log("Product_Code" + this.idup);
// console.log("typeeeeeeee" + this.type_u);
    //  console.log("result" + result);
    this.openDialog1(this.code_u,this.name_u,this.exp_u,this.type_u,this.des_u,this.ins_u,this.amount_u,this.idup,this.BP_id);
    console.log("ins" + this.ins_u);
    console.log("obj 1"+this.code_u,this.name_u,this.exp_u,this.type_u,this.des_u,this.ins_u,this.amount_u,this.idup,this.BP_id);
    });
  }
  
 openDialog1(code_u,name_u,exp_u,type_u,des_u,ins_u,amount_u,idup,BP_id): void {
    
    let dialogRef = this.dialog.open(confirm_updateDialog, {
      data: { code_u :code_u,
        name_u : name_u,
        exp_u : exp_u,
        amount_u : amount_u,
        des_u : des_u,
        ins_u : ins_u,
        type_u : type_u,
        idup : idup,
        BP_id : BP_id }  
    });
   
    dialogRef.afterClosed().subscribe(result => {
      // let idp = code;
      // let obj = {
      //   idp : code,
      //   name: name,
      //   ins: ins,
      //   des: des,
      //   type: type,
      //   amount : amount,
      //   exp:dateU,
      //   bid : 1,
      //   id:  idup
      // }
      // console.log("update"+idp);
      // console.log("obj 2"+name+ins+des+type+amount);
        // this.productService.update(idp,obj).subscribe( data => this.idp = data, 
        //  error => console.log(error),
        // () => console.log("update complete"));

    });
  }
 
  type_add :any;

  openDialogAdd(): void {
    let dialogRef = this.dialog.open(addProductDialog, {
      width: '700px',
      height: '500px',
      data: {  }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      // this.dataAdd = result;
      console.log("result"+result);
      this.type_add =result.typeproduct_add;
      this.id = result.id_add;
      this.name = result.name_add;
      this.date = result.date_add;
      this.amount = result.amount_add;
      this.des = result.des_add;
      this.ins= result.ins_add;
      this.type = this.type_add;
      this.idb = 1;
      console.log("---------------------------------------------------add");
     
      console.log("data type" + this.type);
      
      if(this.id == undefined && this.name == undefined && this.date == undefined && this.type == undefined ){
        console.log("if addproduct");
        this.openDialog_warnAddP();
      }
      else{
      
        this.openDialog_confirmAddP(this.id,this.name,this.date,this.amount, this.des ,this.ins,this.type,this.idb);
      }
    });
  }
  openDialog_warnAddP(): void {
    let dialogRef = this.dialog.open(warnAddPDialog, {
      width: '250px',
      data: { }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog  was closed');
      this.animal = result;
    });
  }
 
  openDialog_confirmAddP(code_add,name_add,date_add,amount_add, des_add ,ins_add,type_add,idb): void {
    let dialogRef = this.dialog.open(confirmAddPDialog, {
      width: '250px',
      data: {  name :name_add}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      
      let insert_p = code_add; 
        let obj = {
          id: code_add,
          name : name_add,
          ins: ins_add,
          des: des_add,
          type: type_add.ProductType_Id,
          date:date_add,
          amount:amount_add,
          idb: 1
        }
        console.log("insert_p"+insert_p);
        console.log("obj"+this.id+this.name+this.ins+this.des+this.type+this.date+this.amount);
         this.productService.sp_insert_Product(insert_p,obj).subscribe( data => this.id = data, 
             error => console.log(error),
            () => console.log("insert complete")); 
    });
  }
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch!=1){
      this.router.navigate(['/' + 'login']);
    }
    //let Branch = localStorage.getItem('currentUserStatus');
    console.log("storage" + this.Branch);
    this.idb = this.Branch;
    this.productService.getAll(this.idb).subscribe(data => {
      this.products = data;
      console.log(data)
      this.dataSource1 = new MatTableDataSource(this.products);
    },
      error => console.log(error));
  }  
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // MatTableDataSource defaults to lowercase matches
    filterValue = filterValue.toUpperCase();
    filterValue = filterValue.toString();
    this.dataSource1.filter = filterValue;
    console.log("filterrrrrrrrrrrrrrrr");
    console.log(filterValue);
  }
  addIdDel(BranchProduct_Id){
    this.idp = BranchProduct_Id;
    console.log("addIdDel: " + this.idp);
  }
  delProduct(): void { 
      let update_string = this.idp;
      console.log(update_string);
      this.productService.del(update_string).subscribe( data => this.idp = data, 
         error => console.log(error),
        () => console.log("delete complete"));
        // console.log(this.types);
     }
  displayedColumns = ['Product_Code', 'Product_Name', 'ProductType_Name', 'BranchProduct_EXP', 'Product_Des', 'Product_Instruction', 'BranchProduct_Amount', 'sss'];
  // dataSource: MatTableDataSource<UserData>;
  dataSource = new ProductDataSource(this.productService);
  /////////////////////////////////////////// search

}
export class ProductDataSource extends DataSource<any> {
  idb:any;
  
  constructor(private productService: ProductService) {
    super();
  }
  connect(): Observable<Product[]> {
    this.idb = 1;
    return this.productService.getAll(this.idb);
  }
  disconnect() { }
}

///////////////////////////////////////////////////////////////////////////// update
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: './update_product_modal.html',
})
export class updateProductDialog implements OnInit{
  productTypes:any;
  typeproduct:any;
  types:any;
  id:any;
  
  selected = this.productTypes;
  constructor(private route: ActivatedRoute,
    private router: Router,
    private productService: ProductService, private _http: Http,
    public dialogRef: MatDialogRef<updateProductDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

    
  onNoClick(): void {
    this.dialogRef.close(); 
  }
  ngOnInit() {
    
    this.productService.getAllT().subscribe( data => this.productTypes = data, 
    error => console.log(error),
   //  console.log("eieiza: " + this.productTypes);
   () => console.log("Get all product complete"));
 }
  // update(code,name,exp,type,des,ins,amount): void {
  //   console.log("do update" + code + name + exp+type+des+ins+amount);
  //   // this.openDialog1(code,name,exp,type,des,ins,amount);

  //   this.data.code =  code;
  //   this.data.name = name;
  //   this.data.exp = exp;
  //   this.data.type= type;
  //   this.data.des= des;
  //   this.data.ins= ins;
  //   this.data.amount = amount;
    
   
        
  //    }
}

///////////////////////////////////////////////////////////////////////////// confirm update
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_confirm_update.html',
})
export class confirm_updateDialog{
  product :any;
  constructor(private route: ActivatedRoute,
    private router: Router,
    private productService: ProductService, private _http: Http,
    public dialogRef: MatDialogRef<confirm_updateDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

    updateBranchProduct(data): void {
      console.log("data"+data)
         //console.log("updateeeeeeeeppppppppppppppppppppppppppp"+code+name+exp+type+des+ins+amount);
         //  this.types =  this.typeproduct.ProductType_Id;
         //  console.log(this.types);
           //let update_string = this.idp + "/" + this.name +"/"+ this.ins +"/" +this.des +"/"+this.id + "/"+this.types;
           
           let obj = {
             id: data.idup,
             name:data.name_u,
             ins: data.ins_u,
             des: data.des_u,
             type: data.type_u,
             BP_id:data.BP_id,
             id_input:data.code_u,
             exp: data.exp_u,
             amount:data.amount_u,
             bid:1
           }
           console.log("data.code" + data.code_u);
           console.log("data.name" + data.name_u);
           console.log("data.ins" + data.ins_u);
           console.log("data.des" + data.des_u);
           console.log("data.type" + data.type_u);
           console.log("data.BP_id" + data.BP_id);
           console.log("data.id_input" + data.idup);
           console.log("data.exp" + data.exp_u);
           console.log("data.amount" + data.amount_u);
           //console.log("data.bid" + bid);
           //console.log("data.id" + data.id);
            //  this.productService.updateBranchProduct(obj).subscribe( data => 
            //   error => console.log(error),
            //  () => console.log("update complete"));
             this.productService.updateBranchProduct(obj).subscribe( data => this.product = data, 
              error => console.log(error),
             //  console.log("eieiza: " + this.productTypes);
             () => console.log("update product complete"));
             
          }
  onNoClick(): void {
    this.dialogRef.close(); 
  }
 
 
     
}
///////////////////////////////////////////////////////////////////////////// add
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_add.html',
})
export class addProductDialog implements OnInit{
//add
id_add :any;
idp_add: any;
name_add: any;
types_add: any;
des_add:any;
ins_add :any;
productTypes_add: any;
addtype_add:any;
typeproduct_add :any;
date_add :any;
amount_add : any;
  constructor(public dialog: MatDialog, private route: ActivatedRoute,
    private router: Router,
    private productService: ProductService, private _http: Http,
    public dialogRef: MatDialogRef<addProductDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }
    ngOnInit() {
      this.productService.getAllType().subscribe( data => this.productTypes_add = data, 
        error => console.log(error),
       //  console.log("eieiza: " + this.productTypes);
       () => console.log("Get all product complete"));
       
      }
      code = new FormControl('', [Validators.required, Validators.email]);

  getErrorMessage() {
    return this.code.hasError('required') ? 'You must enter a value' :
        this.code.hasError('email') ? 'Not a valid email' :
            '';
  }
  namep = new FormControl('', [Validators.required, Validators.email]);

  getErrorMessage2() {
    return this.namep.hasError('required') ? 'You must enter a value' :
        this.namep.hasError('email') ? 'Not a valid email' :
            '';
  }
  onNoClick(): void {
    this.dialogRef.close();
  }

}


///////////////////////////////////////////////////////////////////////////// Wran Add
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_warnAdd.html',
})
export class  warnAddPDialog {

  constructor(
    public dialogRef: MatDialogRef<warnAddPDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(): void {
    this.dialogRef.close();
  }

}

///////////////////////////////////////////////////////////////////////////// confirmAddP
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_confirmAdd.html',
})
export class confirmAddPDialog {

  constructor(
    public dialogRef: MatDialogRef<confirmAddPDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(): void {
    this.dialogRef.close();
  }

}

