import { Component, OnInit, NgZone } from '@angular/core';
import { FormControl, Validators, FormGroupDirective, NgForm } from '@angular/forms';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Console } from '@angular/core/src/console';
import { Router, ActivatedRoute } from '@angular/router';
import { manageProductService } from './manageProduct.service';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Product } from '../product/Product.model';
import { MatFormFieldModule, MatError, MatFormField, MatPlaceholder, MatFormFieldControl } from '@angular/material/form-field';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { Inject } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { NgIf } from '@angular/common';
import { ErrorStateMatcher } from '@angular/material/core';

export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const isSubmitted = form && form.submitted;
    return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
  }
}
@Component({
  selector: 'app-manage-product',
  templateUrl: './manageProduct.component.html'
  //   styleUrls: ['./type-product.component.css']

})
export class manageProductComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  productTypes: any[];
  addtype: any;
  id: any;
  TypeName: any;
  data: any;
  warnAdd: any;
  product: any;
  //ngmodal add
  id_add: any;
  name_add: any;
  date_add: Date;
  type: any;
  des_add: any;
  ins_add: any;
  amount_add: any;
  //// update
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
  typeproduct_add :any;
  
  
  constructor(private zone: NgZone,
    private route: ActivatedRoute,
    private router: Router,
    private manageProductService: manageProductService, private _http: Http, public dialog: MatDialog) { }

  code = new FormControl('', [Validators.required, Validators.email]);
  getErrorMessage() {
    return this.code.hasError('required') ? 'You must enter a value' :
      this.code.hasError('email') ? 'Not a valid email' :
        '';
  }
  namep = new FormControl('', [Validators.required, Validators.email]);
  matcher = new MyErrorStateMatcher();
  getErrorMessage2() {
    return this.namep.hasError('required') ? 'You must enter a value' :
      this.namep.hasError('email') ? 'Not a valid email' :
        '';
  }
reset(){
  this.amount_add = '' 
  this.ins_add=''
  this.des_add=''
  this.typeproduct_add=''
  this.name_add=''
  this.id_add=''
}
  addProduct() {
    console.log(this.typeproduct_add);
   // let tid = this.typeproduct_add.ProductType_Id;
    //console.log("tid" + tid);
    let idb = 1;
    console.log("add" + this.id_add + this.name_add + this.date_add + this.des_add + this.ins_add );
   console.log("typeId"+this.typeproduct_add.ProductType_Id);
    let tid = this.typeproduct_add.ProductType_Id;
    if(this.id_add === undefined && this.name_add === undefined &&   this.des_add === undefined && this.ins_add === undefined  && tid === undefined){
      console.log("if addproduct////////////////////////////////////////////////////////////////");
      this.warnAdd= 1;
      this.openDialog_warnAddP();
    }
    else{
     //let tid = this.typeproduct_add.ProductType_Id;
      this.openDialog_confirmAddP(this.id_add, this.name_add, this.des_add, this.ins_add, tid, idb);
    }
 
  }
  openDialog_warnAddP(): void {
    let dialogRef = this.dialog.open(warnAddPDialogPonly, {
      width: '250px',
      data: { }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog  was closed');
     // this.animal = result;
    });
  }
  openDialog_confirmAddP(id_add, name_add,  des_add, ins_add, tid, idb): void {
    let dialogRef = this.dialog.open(confirmAddProductDialog, {
      width: '250px',
      data: {id_add:id_add, name_add:name_add,  des_add:des_add, ins_add:ins_add, tid:tid, idb:idb }

    
    });
 
    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');

      
    });
  }
 


  ngOnInit() {

    this.manageProductService.getAll().subscribe(data => {
      this.zone.run((() => {
        this.productTypes = data;
      }))
    });

    this.manageProductService.getProduct().subscribe(data => {
      this.zone.run((() => {
        this.product = data;
      }))
    });
  }
  displayedColumns = ['code', 'name', 'des', 'ins', 'type','btt'];
  displayedColumns1 = ['code', 'name', 'des', 'ins', 'type'];
  dataSource = new ProductDataSource(this.manageProductService);


  openDialog(Product_Code,Product_Name,ProductType_Name,Product_Des,Product_Instruction): void {
    // console.log("typeeeeeeeeeeeeeeeeeeeeee" + ProductType_Name);
    
    let dialogRef = this.dialog.open(updateProductOnlyDialog, {
      width: '400px',
      height: '550px',
      
      data: { code: Product_Code, name: Product_Name,
         des:Product_Des,ins:Product_Instruction ,types:ProductType_Name,typeup :this.typeup }  
    });
    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.code_u = Product_Code;
      this.name_u = result.name;
      this.des_u = result.des;
      this.ins_u = result.ins;
      this.type_u = result.typeup;
      this.idup =  result.code;
      
//       console.log("code_u" + this.code_u);
//       console.log("Product_Code" + this.idup);
// console.log("typeeeeeeee" + this.type_u);
    //  console.log("result" + result);
    this.openDialog1(this.code_u,this.name_u,this.type_u,this.des_u,this.ins_u,this.idup);
    console.log("obj 1 dialog "+this.code_u+this.name_u+this.ins_u+this.des_u+this.type_u,this.idup);
    });
  }
  openDialogDel(Product_Name,Product_Code): void {
    let id = Product_Code;
    let test = Product_Name;
    console.log("id" + id + test);
    let dialogRef = this.dialog.open(DelDialog, {
      width: '250px',
      data: { name: Product_Name , id : Product_Code }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      //this.animal = result;
    });
  }
  
 openDialog1(code,name,type,des,ins,idup): void {
console.log("open dialog1111111111111111111");
console.log("obj"+code+name+type+des+ins+idup);
    let dialogRef = this.dialog.open(confirm_updateOnlyDialog, {
      
      data: {  name: name }  
    });
   
    dialogRef.afterClosed().subscribe(result => {
   
      let obj = {
        code : code,
        name: name,
        ins: ins,
        des: des,
        typeId: type,
        code_update:  idup
      }
      console.log("obj 2"+code+name+ins+des+type+idup);
        this.manageProductService.update(obj).subscribe(  
         error => console.log(error), 
        () => console.log("update complete"));

    });
  }

}
export class ProductDataSource extends DataSource<any> {
  constructor(private manageProductService: manageProductService) {
    super();
  }
  connect(): Observable<Product[]> {
    return this.manageProductService.getProduct();
  }
  disconnect() { }

}
///////////////////////////////////////////////////////////////////////////// confirmAddP
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_confirmAdd.html',
})
export class confirmAddProductDialog   {
  constructor(private manageProductService: manageProductService,
    public dialogRef: MatDialogRef<confirmAddProductDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }


   addProductConfirm(data){
     let insert_p = data.id_add;
    let obj = {
      id: data.id_add,
      name: data.name_add,
      ins: data.ins_add,
      des: data.des_add,
      type: data.tid,
      // date: data.date_add,
      // amount: data.amount_add,
      idb: 1
    }
    console.log("check" + insert_p + data.id_add+data.name_add+data.ins_add+data.des_add+data.tid);
    //console.log("obj"+this.id+this.name+this.ins+this.des+this.type+this.date+this.amount);
    this.manageProductService.sp_insert_Product(insert_p, obj).subscribe(
      error => console.log(error),
      () => console.log("insert complete"));

      // this.manageProductService.getAll().subscribe(data => {
      // });
   }
  onNoClick(): void {
    this.dialogRef.close();
  }

}
/////////////update//////////////////////////////
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: './update_product_modal.html',
})
export class updateProductOnlyDialog implements OnInit {
  productTypes: any;
  product: any;
  types: any;
  id: any;
Branch : any;
  selected = this.productTypes;
  constructor(private route: ActivatedRoute,
    private router: Router,
    private manageProductService: manageProductService, private _http: Http,
    public dialogRef: MatDialogRef<updateProductOnlyDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }


  onNoClick(): void {
    this.dialogRef.close();
  }
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch!=1){
      this.router.navigate(['/' + 'login']);
    }
    this.manageProductService.getAll().subscribe(data => this.productTypes = data,
      error => console.log(error),
      //  console.log("eieiza: " + this.productTypes);
      () => console.log("Get all product complete"));
  }
  
}

///////////////////////////////////////////////////////////////////////////// confirm update
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_confirm_update.html',
})
export class confirm_updateOnlyDialog {
  product :any;
  constructor(private route: ActivatedRoute,
    private router: Router,
    private manageProductService: manageProductService, private _http: Http,
    public dialogRef: MatDialogRef<confirm_updateOnlyDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }


  onNoClick(): void {
    this.dialogRef.close();
  }
  update(code, name, type, des, ins,code_update ): void {
    
    console.log("updateeeeeeeeppppppppppppppppppppppppppp" + code + name + type + des + ins +code_update );
    //  this.types =  this.typeproduct.ProductType_Id;
    //  console.log(this.types);
    //let update_string = this.idp + "/" + this.name +"/"+ this.ins +"/" +this.des +"/"+this.id + "/"+this.types;
    
    let obj = {
      code: code_update,
      name: name,
      ins: ins,
      des: des,
      type: type,
      code_update : code
    }
    
    this.manageProductService.update( obj).subscribe(data =>
      error => console.log(error),
      () => console.log("update complete"));
    // console.log(this.types);
    this.manageProductService.getProduct().subscribe(data => {
      //this.zone.run((() => {
        this.product = data;
     
    });
    
    this.manageProductService.getProduct().subscribe(data => {
      // this.zone.run((() => {
         this.product = data;
     //  }))
     });

  }


}
///////////////////////////////////////////////////////////////////////////// Wran Add
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_warnAdd.html',
})
export class  warnAddPDialogPonly {

  constructor(
    public dialogRef: MatDialogRef<warnAddPDialogPonly>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'del-dialog.html',
})
export class DelDialog {
  product :any;
  constructor( private manageProductService: manageProductService, private _http: Http,
    public dialogRef: MatDialogRef<DelDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(): void {
    this.dialogRef.close();
  }
  del(id){
    let obj = {
      id: id
    }
    console.log("del" + id)
    this.manageProductService.delP( obj).subscribe(data =>
      error => console.log(error),
      () => console.log("del complete"));

      this.manageProductService.getProduct().subscribe(data => {
       // this.zone.run((() => {
          this.product = data;
      //  }))
      });
  }

}