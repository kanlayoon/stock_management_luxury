import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-dashboard-head-office',
  templateUrl: './dashboard-head-office.component.html',
  styleUrls: ['./dashboard-head-office.component.css']
})
export class DashboardHeadOfficeComponent implements OnInit {
Branch : any;
  constructor(private route: ActivatedRoute,
    private router: Router,) { }

  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch!=1){
      this.router.navigate(['/' + 'login']);
    }
  }

}
