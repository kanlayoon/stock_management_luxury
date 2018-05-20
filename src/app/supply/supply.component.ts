import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatFormFieldModule, MatError, MatFormField, MatPlaceholder, MatFormFieldControl } from '@angular/material/form-field';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { SupplyService } from '../supply/supply.service';
import { Product } from '../product/product.model';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Router, ActivatedRoute } from '@angular/router';
import { Inject } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';


@Component({
  selector: 'app-supply',
  styleUrls: ['./supply.component.css'],
  templateUrl: './supply.component.html',
})
export class SupplyComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  product: any;
  code: any;

  animal: string;
  name: string;
  branchName:any;
  Amount: number;
  branchsel: any;
  public products: any[];
  branchs: any;
  selectbranch: any;
  branch: any;
  date: any;
  public checkProduct :any;
  BranchProduct_EXP :any;
  temp :number;
  Branch :any;
  number : any;
  supplyAmount :any;

  private productList: Product[];
  public element :any;
  constructor(public dialog: MatDialog,
    private route: ActivatedRoute,
    private router: Router,
    private supplyService: SupplyService, private _http: Http) {

  }
  openDialog(): void {
    let dialogRef = this.dialog.open(check_branch_supplyDialog, {
      width: '250px',
      data: { name: this.name, animal: this.animal }
    });

    dialogRef.afterClosed().subscribe(result => {
      //console.log('The dialog was closed');
      this.animal = result;
    });
  }
  openDialog1(): void {
    let dialogRef = this.dialog.open(check_amount_supplyDialog, {
      width: '250px',
      data: { name: this.name, animal: this.animal }
    });

    dialogRef.afterClosed().subscribe(result => {
      //console.log('The dialog was closed');
      this.animal = result;
    });
  }
  openDialog2(BranchProduct_Id,pCode, amount,branchName,productName,bid,temp,BranchProduct_EXP): void {
    let dialogRef = this.dialog.open(modal_confirm_supplyDialog, {
      width: '250px',
      data: { BP_id:BranchProduct_Id,code :pCode,amount: amount,branch :branchName,name : productName ,bid:bid ,temp:temp,BranchProduct_EXP:BranchProduct_EXP}
    });

    dialogRef.afterClosed().subscribe(result => {
     // console.log('The dialog was closed');
      this.animal = result;
      // this.supply(code,amount);
    });
  }
  //////////////////////////////////new supply
  supplySupply(Pcode,amountInput,sumAmount): void{
   
   
    if (this.selectbranch === undefined) {
      //console.log("check");
      this.openDialog();
    }
    if (this.selectbranch !== undefined) {
      let bid = this.selectbranch.Branch_Id
    if(amountInput === undefined ||amountInput ==="" ){
      document.getElementById("openModalwarn").click();
    }
    else{
      console.log("supplysupply Function" + Pcode  +amountInput+bid+ sumAmount );
  
  let obj = {
    code :Pcode ,
    number : amountInput ,
    branchid :  bid ,
    date : this.date = new Date(), 
    head_id : this.Branch,
    amountReq : sumAmount,
    Req_id : '' ,
    note : '',
     
  }
  console.log("sumAmount" + sumAmount);
  this.supplyService.supplyReq(obj).subscribe(data => {
      this.supplyAmount = data;  
      console.log("return" + this.supplyAmount);
      if(this.supplyAmount == 0 ){
        console.log("checkkkkkk" + this.supplyAmount);
        document.getElementById("openModalButton").click();
              // this.warningProduct.nativeElement.click();
                //this.warnningPLess = 1;
            }
            else{
                document.getElementById("openModalButton2").click();
            }
    }, error => console.log(error));
     
    }
  }
  

  }
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch!=1){
      this.router.navigate(['/' + 'login']);
    }
  
    this.supplyService.supplyDel().subscribe(
      error => console.log(error),
      () => console.log("supply del complete"));
    this.supplyService.getBranch().subscribe(data => this.branchs = data,
      error => console.log(error),
      () => console.log("Get all product complete"));

    this.supplyService.getProduct(this.Branch).subscribe(data => {
      this.products = data;
      //console.log(data);
      this.dataSource1 = new MatTableDataSource(this.products);
    },
      error => console.log(error));
      
  }

  displayedColumns = ['Product_Id', 'Product_Name', 'ProductType_Name', 'Product_Des', 'Product_Instruction', 'sumAmount', 'input_num', 'button'];
  // dataSource: MatTableDataSource<UserData>;
  
  dataSource = new ProductDataSource(this.supplyService);
 
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // MatTableDataSource defaults to lowercase matches
    filterValue = filterValue.toUpperCase();
    filterValue = filterValue.toString();
    this.dataSource1.filter = filterValue;
    // console.log("filterrrrrrrrrrrrrrrr");
    // console.log(filterValue);
  }
   public int; check(BranchProduct_Id,pCode,amount,branchName,name,BranchProduct_EXP,branchsel){
     console.log("check fucntion")
    let obj = {
      code : pCode,
      date : BranchProduct_EXP,
      bid :branchsel
    }
    //console.log("show check" + pCode + BranchProduct_EXP + branchsel);
    this.supplyService.checkProduct(obj).subscribe(data => {this.checkProduct = data;
      //console.log("check :"+ this.checkProduct.countProduct);
      this.checkProduct.forEach(element => {
        //console.log(element.countProduct);
        this.temp = element.countProduct;
        console.log("temp"+ this.temp);
        this.openDialog2(BranchProduct_Id,pCode, amount,this.branchName,name,this.branchsel,this.temp,BranchProduct_EXP);
        //console.log("openDialog"+BranchProduct_Id+pCode+ amount+this.branchName+name+this.branchsel+this.temp,BranchProduct_EXP);
      });
    },
      error => console.log(error),
      () => console.log("Get all product complete")
    );
  
  
  }
  //amouuuuuuuunttttttttttt1331212sdsdsd88888151222-12-28T00:00:00undefined
  supply(BranchProduct_Id,pCode, amount,name,amountPro,index,BranchProduct_EXP): void {

    
     console.log("supply function");
    // console.log("pCode"+pCode);
    // console.log("amount"+amount);
    // console.log("name"+name);
    // console.log("amountPro"+amountPro);
    // console.log("index"+index);
    // console.log("BranchProduct_EXP"+BranchProduct_EXP);
  
     //console.log("amouuuuuuuunttttttttttt" + BranchProduct_Id+pCode+ amount+name+amountPro+index+BranchProduct_EXP);
    // console.log("nui: " + this.dataSource.data[i])
    // console.log("Fsupply");
    // console.log(this.selectbranch);
    let check = this.checkProduct_EXP(pCode, this.Branch,BranchProduct_Id,BranchProduct_EXP);
    if (this.selectbranch === undefined) {
      //console.log("check");
      this.openDialog();
    }else if(check ==1 ){
      document.getElementById("openModalButton2").click();

    }
    else if(check ==0){

    
     if (this.selectbranch !== undefined) {
      this.branchsel = this.selectbranch.Branch_Id;
      this.branchName = this.selectbranch.Branch_Name;
      // console.log("branch" + this.branchsel);
       if(amount === undefined){
        this.openDialog1();
      }
      else if(amount !== undefined){
        if(amount>amountPro){
          console.log("amount"+amount);
          console.log("amountpro"+amountPro);
          document.getElementById("openModalButton").click();
        }     
        else{
          //this.checkProduct_EXP(pCode, this.Branch,BranchProduct_Id,BranchProduct_EXP);
          this.check(BranchProduct_Id,pCode,amount,this.branchName,name,BranchProduct_EXP,this.branchsel);
          //this.openDialog2(BranchProduct_Id,pCode, amount,this.branchName,name,this.branchsel,this.temp);
         // console.log("show check" + BranchProduct_Id+pCode+ amount+this.branchName+name+this.branchsel+this.temp);
        }

      }
      this.supplyService.supplyDel().subscribe(data => pCode = data,
        error => console.log(error),
        () => console.log("supply del complete"));
      //this.dataSource1.data.length =0;
        this.supplyService.getProduct(this.Branch).subscribe(data => {
          this.products = data;
          //console.log(data);
          this.dataSource1 = new MatTableDataSource(this.products);
        },
          error => console.log(error));
  
    }
  }
   
  }

  onRowClicked(row) {

  }

checkProduct_EXP(code,bid,BP_id,exp):number {
    console.log("checkkkkkkkkkkkkkkkkkk");
    let obj = {
        code : code,
        bid : this.branch
    }
    let product_check
    this.supplyService.getProduct_checkEXP(obj).subscribe(data => {
      product_check = data;

      this.number = product_check.length()
      console.log("number" + this.number);
      for(let i ;i<this.number ;i++){
        if(exp > product_check.BranchProduct_EXP){
          console.log("exp > bpexp" );
          return 1;
        }
        else{
          console.log("exp < bpexp" );
          return 0;
        }
      }

    },
      error => console.log(error)
   );
   return 0;
  }


}

export class ProductDataSource extends DataSource<any> {
  Branch : any;
  constructor(private supplyService: SupplyService) {
    super();
  }
  connect(): Observable<Product[]> {
    this.Branch = localStorage.getItem('currentUserStatus')
   
    return this.supplyService.getProduct(this.Branch);
  }
  disconnect() { }
}

@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_check_branch.html',
})
export class check_branch_supplyDialog {

  constructor(
    public dialogRef: MatDialogRef<check_branch_supplyDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_check_amount.html',
})
export class check_amount_supplyDialog {

  constructor(
    public dialogRef: MatDialogRef<check_amount_supplyDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'modal_confirm_supply.html',
})
export class modal_confirm_supplyDialog {
  
  product: any;
  code: any;
  animal: string;
  name: string;
  Amount: number;
  branchsel: any;
  public products: any[];
  branchs: any;
  selectbranch: any;
  branch: any;
  date: any;
  private productList: Product[];

  constructor(public dialog: MatDialog,
    private route: ActivatedRoute,
    private router: Router,
    private supplyService: SupplyService, private _http: Http,
    public dialogRef: MatDialogRef<modal_confirm_supplyDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(): void {
    this.dialogRef.close();
  }
  supplyConfirm(pCode, amount,bid): void {
  
     console.log("Fsupply");
    // console.log("pCode"+pCode);
    // console.log("amount"+amount);
    // console.log("bid"+bid);
      this.code = pCode;
      // console.log(pCode);
      // console.log(amount);
      let obj = {
        code: pCode,
        number: amount,
        branchid:bid,
        Date: this.date = new Date(),
        head_id: 1,
        BP_id : this.data.BP_id,
        exp : this.data.BranchProduct_EXP
      }
      if(this.data.temp == 0 ){
        console.log("temp" + this.data.temp);
        this.supplyService.supplyInsert(obj).subscribe(data => pCode = data,
          error => console.log(error),
          () => console.log("supply insert complete"));
  
      }else{
        console.log("temp" + this.data.temp);
        this.supplyService.supplyUpdate(obj).subscribe(data => pCode = data,
          error => console.log(error),
          () => console.log("supply update complete"));
      }
      this.supplyService.supplyDel().subscribe(data => pCode = data,
        error => console.log(error),
        () => console.log("supply del complete"));
      //this.dataSource1.data.length =0;
        this.supplyService.getProduct(1).subscribe(data => {
          this.products = data;
          //console.log(data);
         
        },
          error => console.log(error));
      // this.supplyService.supply(obj).subscribe(data => pCode = data,
      //   error => console.log(error),
      //   () => console.log("supply complete"));
      
  }
  // export() {
  //   this.ManagementExportService.export(this.currentLocation, this.fromDate, this.toDate)
  //       .subscribe(data => this.downloadFile(data)),//console.log(data),
  //                   error => console.log("Error downloading the file."),
  //                   () => console.log('Completed file download.');
  //   }
    
    downloadFile(data){
      var blob = new Blob([(<any>data)], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'});
      var url= window.URL.createObjectURL(blob);
      window.open(url);
      console.log();
  }
 

}
