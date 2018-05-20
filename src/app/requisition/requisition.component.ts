import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatFormFieldModule, MatError, MatFormField, MatPlaceholder, MatFormFieldControl } from '@angular/material/form-field';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { RequisitionService } from '../requisition/Requisition.service';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Router, ActivatedRoute } from '@angular/router';
import { Reqproduct } from './requisition.model';
import { reqCheck } from './requisition.model';
import { ProductService } from '../product/product.service';

export class State {
  constructor(public name: string, public population: string, public flag: string,
    private route: ActivatedRoute,
    private router: Router, private RequisitionService: RequisitionService, private _http: Http,

  ) { }
}
@Component({
  selector: 'app-requisition',
  templateUrl: './requisition.component.html',
  styleUrls: ['./requisition.component.css']
})

export class RequisitionComponent implements OnInit {

  @ViewChild('warningClose') warningColse: ElementRef;
  @ViewChild('warning') warningProduct: ElementRef;
  dataSource1: MatTableDataSource<{}>;
  constructor(private RequisitionService: RequisitionService, private _http: Http, private route: ActivatedRoute,
    private router: Router) { }
  public Reqproducts: any;
  reqCheck: any;
  reqAmount: any;
  code: any;
  pCode: any;
  pName: any;
  branchs: any;
  products: any;
  amount: any;
  date: any;
  supplyAmount: any;
  selectbranch: any;
  branch: any;
  product: any;
  warnningPLess: any;
  note: any;
  Branch: any;
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if (this.Branch != 1) {
      this.router.navigate(['/' + 'login']);
    }
    this.RequisitionService.getBranch().subscribe(data => this.branchs = data,
      error => console.log(error),
      () => console.log("Get all product complete"));

    this.RequisitionService.get_AllReq().subscribe(data => {
      this.Reqproducts = data;
      this.dataSource1 = new MatTableDataSource(this.Reqproducts);
      console.log(data);
      //console.log("get all req complitse")
    }, error => console.log(error));

  }

  supplyReq(Pcode, amountInput, Branch_Id, amountReq, ReqProduct_Id, reqNote): void {
    if (amountInput == undefined) {
      document.getElementById("openModalwarn").click();
    }

    else {
      console.log("noteeeeeeeeeeeeee" + reqNote);
      console.log("supplyReq" + Pcode + amountInput + Branch_Id, amountReq, ReqProduct_Id);
      let obj = {
        code: Pcode,
        number: amountInput,
        branchid: Branch_Id,
        date: this.date = new Date(),
        head_id: this.Branch,
        amountReq: amountReq,
        Req_id: ReqProduct_Id,
        note: reqNote
      }
      console.log("obj ReqProducr_Id" + ReqProduct_Id);
      this.RequisitionService.supplyReq(obj).subscribe(data => {
        this.supplyAmount = data;
        console.log("return" + this.supplyAmount);
        if (this.supplyAmount == 0) {
          console.log("checkkkkkk" + this.supplyAmount);
          document.getElementById("openModalButton").click();
          // this.warningProduct.nativeElement.click();
          //this.warnningPLess = 1;
        }
        else {
          document.getElementById("openModalButton2").click();
        }
      }, error => console.log(error));

    }


  }

  check(Pcode, Pname): void {
    console.log("Fcheck");
    let Code = this.code;
    this.pCode = Pcode;
    this.pName = Pname;

    this.RequisitionService.check(Pcode).subscribe(data => {
      this.reqCheck = data;
      error => console.log(error);
      // console.log(this.reqCheck);
      // console.log("pcode" + Pcode)
    });
    let branch = {
      bid: this.Branch,
      code: Pcode

    };
    this.RequisitionService.get_amount(branch).subscribe(data => {
      this.reqAmount = data;
      // console.log( "getAmount" + this.reqAmount)
    }, error => console.log(error));

  }




  displayedColumns = ['ProductReq_Date', 'branch', 'Product_Code', 'Product_Name', 'QuantityUpdate', 'check', 'amount', 'note', 'button'];
  displayedColumns2 = ['branch', 'amount', 'date'];
  dataSource = new requisitionDataSource(this.RequisitionService);
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // MatTableDataSource defaults to lowercase matches
    filterValue = filterValue.toUpperCase();
    filterValue = filterValue.toString();
    this.dataSource1.filter = filterValue;
    console.log("filterrrrrrrrrrrrrrrr");
    console.log(filterValue);
  }
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
}

//////////////////////////////////////////////////////
export class requisitionDataSource extends DataSource<any> {
  products: any;
  constructor(private RequisitionService: RequisitionService) {
    super();
  }
  connect(): Observable<Reqproduct[]> {
    return this.RequisitionService.get_AllReq();
  }
  disconnect() { }
}
