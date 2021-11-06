import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreaTorneoComponent } from './crea-torneo.component';

describe('CreaTorneoComponent', () => {
  let component: CreaTorneoComponent;
  let fixture: ComponentFixture<CreaTorneoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreaTorneoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreaTorneoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
