import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
@Component({
  selector: 'app-dashboard-branch',
  templateUrl: './dashboard-branch.component.html',
  styleUrls: ['./dashboard-branch.component.css']
})
export class DashboardBranchComponent implements OnInit {
Branch :any;
  constructor(  private route: ActivatedRoute,
    private router: Router) { }

  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch==1){
      this.router.navigate(['/' + 'login']);
    }
  }

}
