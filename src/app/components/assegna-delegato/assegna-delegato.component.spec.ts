import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssegnaDelegatoComponent } from './assegna-delegato.component';

describe('AssegnaDelegatoComponent', () => {
  let component: AssegnaDelegatoComponent;
  let fixture: ComponentFixture<AssegnaDelegatoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AssegnaDelegatoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AssegnaDelegatoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
