import { Component, OnInit } from '@angular/core';
import {   ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import { manageCourseProductService } from './manage-course-product.service';
import { DataSource } from '@angular/cdk/collections';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import {MatPaginatorModule} from '@angular/material/paginator';
import { Router, ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-manage-course-product',
  templateUrl: './manage-course-product.component.html',
  styleUrls: ['./manage-course-product.component.css']
})
export class ManageCourseProductComponent implements OnInit {
  public allCP :any;
  updateAmount:any;
  Branch:any;
  dataSource1: MatTableDataSource<any>;
  constructor(private manageCourseProductService: manageCourseProductService, private _http: Http,private route: ActivatedRoute,
    private router: Router,) {

  }
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch!=1){
      this.router.navigate(['/' + 'login']);
    }
    this.manageCourseProductService.getAllCP().subscribe( data => {
      this.allCP = data, 
      this.dataSource1 = new MatTableDataSource(this.allCP);
    },
    error => console.log(error));
  }
  displayedColumns = ['CID', 'Course_Name', 'Product_Name', 'Amount','input_num','button'];
  dataSource = new ProductDataSource(this.manageCourseProductService);
  //dataSource = new MatTableDataSource(this.allCP);

  //@ViewChild(MatPaginator) paginator: MatPaginator;
  //@ViewChild(MatSort) sort: MatSort;

  updateAmountCP(CP_id,amount){
    console.log("CP_id"+ CP_id);
    console.log("aount" + amount);
  let obj = {
    number:amount,
    CP_id : CP_id
  }
  this.manageCourseProductService.updateCPAmount(obj).subscribe( data => this.updateAmount = data, 
    error => console.log(error),
   () => console.log("delete complete"));
   document.getElementById("openModalButton").click();
  }

  /**
   * Set the paginator and sort after the view init since this component will
   * be able to query its view for the initialized paginator and sort.
   */
  ngAfterViewInit() {
   // this.dataSource1.paginator = this.paginator;
   // this.dataSource1.sort = this.sort;
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

}
export class ProductDataSource extends DataSource<any> {
  idb:any;
  
  constructor(private manageCourseProductService: manageCourseProductService) {
    super();
  }
  connect(): Observable<courseProduct[]> {
    this.idb = 1;
    return this.manageCourseProductService.getAllCP();
    
  }
  disconnect() { }
}
export class courseProduct{
  public Product_Code: number;
  public Product_name: string; 
 public Amount :number;
 public CourseProduct_Id : number;
 public Course_Id :number;
 public Course_Name : string;


}

