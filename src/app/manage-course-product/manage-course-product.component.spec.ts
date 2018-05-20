import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageCourseProductComponent } from './manage-course-product.component';

describe('ManageCourseProductComponent', () => {
  let component: ManageCourseProductComponent;
  let fixture: ComponentFixture<ManageCourseProductComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageCourseProductComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageCourseProductComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
