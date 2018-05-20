import { Component, OnInit } from '@angular/core';
import {FormControl, Validators} from '@angular/forms';
import {MatFormFieldModule, MatError, MatFormField, MatPlaceholder, MatFormFieldControl} from '@angular/material/form-field';
import {NgbModal, NgbActiveModal} from '@ng-bootstrap/ng-bootstrap';
import { Http, Headers, RequestOptions, Response} from '@angular/http';
import { Console } from '@angular/core/src/console';
import { Router, ActivatedRoute } from '@angular/router';
import { AddProductTypeService } from '../add-product/add-productType.service';
import {UpdateService} from '../update-product/update-product.service';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { DataSource } from '@angular/cdk/collections';
import { addAmountProduct } from './add-product.model';
import { Observable, Subject } from 'rxjs/Rx';
import { ProductService } from '../product/product.service';
@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css'],
  
})

export class AddProductComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  addAP :any;
  idp: any;
  name: any;
  types: any;
  des:any;
  ins :any;
  productTypes: any;
  addtype:any;
  typeproduct :any;
  date :any;
  amount : any;
  bid :any;
 
  products = [];
  ProductCode :any;
  show :any;
  Branch :any;

  private productList: addAmountProduct[];
  constructor(
    private route: ActivatedRoute,
    private router: Router,private productService: ProductService,
    private AddProductTypeService: AddProductTypeService, private _http: Http,) { }
  
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch!=1){
      this.router.navigate(['/' + 'login']);
    }
 this.bid = this.Branch;
    this.AddProductTypeService.getAllProduct().subscribe( data => {
      this.products = data;
      console.log(data); 
      this.dataSource1 = new MatTableDataSource(this.products);
    }, 
      error => console.log(error),
     () => console.log("getproductAddAmount "+ this.products));
     
     console.log("testttt"+this.products);
     
  
     if(this.ProductCode!= undefined){
      return this.show = 1;
  }
  // console.log("show"+this.show);
  // console.log("show"+this.ProductCode);
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
 
Show(productC){
//  console.log("code"+productC);
}
addAmount(code,amount,exp){
console.log("code amount exp" + code + amount + exp)
let obj = {
  code : code,
  bid : this.bid,
  date : exp,
  amount :amount
}
console.log("obj"+code + this.bid+exp+amount);
this.AddProductTypeService.addAmountProduct(obj).subscribe( data =>
   this.addAP = data, 
  error => console.log(error),
 () => console.log("insert complete"));

 //location.reload();
}

       displayedColumns = ['Product_Code', 'Product_Name', 'ProductType_Name',  'exp','amount','btt'];
       dataSource = new ProductDataSource(this.AddProductTypeService);
}
export class ProductDataSource extends DataSource<any> {
  idb:any;
  
  constructor(private AddProductTypeService: AddProductTypeService) {
    super();
  }
  connect(): Observable<addAmountProduct[]> {
    this.idb = 1;
    return this.AddProductTypeService.getAllProduct();
  }
  disconnect() { }
}
